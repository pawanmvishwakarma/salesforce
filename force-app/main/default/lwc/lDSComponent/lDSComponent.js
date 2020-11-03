import { LightningElement, track, wire } from 'lwc';
import { createRecord, getRecord } from 'lightning/uiRecordApi';
/* https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_lightning_ui_api_record */

const fieldArray = ['Account.Name', 'Account.Phone', 'Account.Website'];

export default class LDSComponent extends LightningElement {
    @track accountName;
    @track accountPhone;
    @track accountSite;
    @track recordId;
    @wire(getRecord, {recordId:'$recordId', fields: fieldArray})
    accountRecord;


    accountNamehandler(event){
        this.accountName = event.target.value;
    }

    accountPhonehandler(event){
        this.accountPhone = event.target.value;
    }

    accountSitehandler(event){
        this.accountSite = event.target.value;
    }

    accountCreateHandler(){
        const fields = {'Name' : this.accountName, 'Phone' : this.accountPhone, 'Website': this.accountSite};
        const recordInput = { apiName : 'Account', fields};

        console.log(recordInput);

        createRecord(recordInput).then(response =>{
            this.recordId = response.id;
            console.log('Account created : '+response.id)
        }).catch(error =>{
            console.error('Error in create record : '+error.body.message);
        })
    }

    get getName(){
        if(this.accountRecord.data)
            return this.accountRecord.data.fields.Name.value;
        return undefined;
    }
    get getPhone(){
        if(this.accountRecord.data)
            return this.accountRecord.data.fields.Phone.value;
        return undefined;
    }
    get getSite(){
        if(this.accountRecord.data)
            return this.accountRecord.data.fields.Website.value;
        return undefined;
    }
}