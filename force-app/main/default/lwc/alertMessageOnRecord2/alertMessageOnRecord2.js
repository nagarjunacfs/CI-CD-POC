/* eslint-disable no-debugger */
/* eslint-disable no-alert */
import { LightningElement, api, wire, track } from 'lwc';
import { getRecord} from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class AlertMessageOnRecord2 extends LightningElement {
 @api recordId;
 @api objectApiName;
 @track alertMessage;
 @track sObj;
 fieldName = ['nrg__Alert_Message__c'];

 @wire(getRecord, { recordId: '$recordId', fields: '$fieldName'})
 sObjectRecord({ error, data }) {
    if (error) {
    let message = 'Unknown error';
    if (Array.isArray(error.body)) {
    message = error.body.map(e => e.message).join(', ');
    } else if (typeof error.body.message === 'string') {
    message = error.body.message;
    }
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Error loading Account',
    message,
    variant: 'error',
    }),
    );
    } else if (data) {
    this.sObj = data;
    this.alertMessage = this.sObj.fields.nrg__Alert_Message__c.value;
    let message = 'Alert Message: ' + this.alertMessage;
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Alert:',
    message,
    variant: 'info',
    
    }),
    );
    }
    }
}