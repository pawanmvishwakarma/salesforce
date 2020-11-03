import { api, LightningElement, track } from 'lwc';

export default class CallChildMethodFromParentChild extends LightningElement {
    @track value;

    @api
    selectCheckboxHandler(){
        const childComponent = this.template.querySelector('c-call-child-method-from-parent');
        
        const message = childComponent.selectCheckbox(this.value);
        console.log(message);
    }

    valueChangeHandler(event){
        this.value = event.target.value;
        console.log(this.value);
    }
}