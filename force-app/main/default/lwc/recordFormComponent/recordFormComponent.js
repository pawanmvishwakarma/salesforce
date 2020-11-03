import { LightningElement, track } from 'lwc';
// For hard reference to object field use @salesforce/schema
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
// Hard refeance end
export default class RecordFormComponent extends LightningElement {
    @track recordId;
    
    //fieldArray = ['Name', 'Phone', 'Website']; this use when you are not using hard ref to object
    fieldArray = [NAME_FIELD, PHONE_FIELD, WEBSITE_FIELD]; //used we are using hard reference to object

    successHandler(event){
        this.recordId = event.detail.id;
    }
}