import { LightningElement, track, wire } from 'lwc';
import getAccountData from '@salesforce/apex/AccountManager.getAccounts';

export default class CallApexMethodComponent extends LightningElement {
    @track numberOfAccount;

    @track accountList;

    recordCountHandler(event){
        this.numberOfAccount = parseInt(event.target.value);
    }

    getAccounthandle(){
        getAccountData({numberOfRecord: this.numberOfAccount}).then(response =>{
            this.accountList = response;
        }).catch(error =>{
            console.error('Error occure due to : '+error.body.message);
        });
    }

}