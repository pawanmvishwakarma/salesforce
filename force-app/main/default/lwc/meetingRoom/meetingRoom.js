import { api, LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

export default class MeetingRoom extends LightningElement {
    @api meetingRoomInfo = {roomName: 'A-01', roomCapacity: '13'};
    @wire(CurrentPageReference) pageRef;

    tileClickedHandler(){
        // If we dont want to add event listner the this is used
        //const tileClicked = new CustomEvent('tileclick', {detail : this.meetingRoomInfo});

        //If we want to add event listner then we have to add bubble property true
        const tileClicked = new CustomEvent('tileclick', {detail : this.meetingRoomInfo, bubbles:true});
        this.dispatchEvent(tileClicked);

        fireEvent(this.pageRef, 'pubsubtileclick', this.meetingRoomInfo)
    }
}