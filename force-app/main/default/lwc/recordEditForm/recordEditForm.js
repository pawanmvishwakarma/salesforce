import { LightningElement, track } from 'lwc';

export default class RecordEditForm extends LightningElement {
    @track recordId;
    successHandler(event){
        this.recordId  = event.detail.id;
    }
}