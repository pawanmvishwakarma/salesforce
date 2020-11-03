import { api, LightningElement, track } from 'lwc';

export default class CallChildMethodFromParent extends LightningElement {
    @track value = ['red'];

    options = [
        { label: 'Red Marker', value: 'red' },
        { label: 'Blue Marker', value: 'blue' },
        { label: 'Green Marker', value: 'green' },
        { label: 'Black Marker', value: 'black' },
        { label: 'Yellow Marker', value: 'yellow' }
    ];

    @api 
    selectCheckbox(checkboxValue){
        const selectedcheckbox = this.options.find(checkbox =>{
            return checkbox.value === checkboxValue;
        });

        if(selectedcheckbox){
            this.value = selectedcheckbox.value;
            return "Sucessfully checkbox found.";
        }

        return "No checkbox found.";
    }
}