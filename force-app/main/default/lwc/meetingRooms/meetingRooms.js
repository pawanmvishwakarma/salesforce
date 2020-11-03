import { LightningElement, track } from 'lwc';

export default class MeetingRooms extends LightningElement {
    selectedMeetingRoom;
    @track meetingRooms = [
        {roomName : 'A-01', roomCapacity : '20'},
        {roomName : 'A-02', roomCapacity : '18'},
        {roomName : 'B-01', roomCapacity : '15'},
        {roomName : 'B-02', roomCapacity : '12'},
        {roomName : 'C-01', roomCapacity : '22'},
        {roomName : 'C-02', roomCapacity : '34'}
    ];

    onTileSelectHandler(event){
        const meetingRoomInfo = event.detail;
        this.selectedMeetingRoom = meetingRoomInfo.roomName;

    }

    constructor(){
        super();
        this.template.addEventListener('tileclick', this.onTileSelectHandler.bind(this));
    }
}