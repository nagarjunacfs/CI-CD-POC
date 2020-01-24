/* eslint-disable no-console */
/* This JS file retrieves the Account and Contact record details 
    and dispalys the Alert field value as a toast message
 */

/* eslint-disable no-undef */
/* eslint-disable no-debugger */
/* eslint-disable no-alert */
import { LightningElement, api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';

export default class AlertMessageOnRecord extends LightningElement {
    @api recordId;
    @api objectApiName;
    @track accObj;
    @track contactObj;
    @track caseObj;
    @track accAlertMessage;
    @track contactAlertMessage;
    @track caseAlertMessage;
    
    /* This method retrieves the Alert Message field value on Account object
     */
    @wire(getRecord, { recordId: '$recordId', fields: ['Account.nrg__Alert_Message__c'] })
    accountRecord({ error, data }) {
        
    if (error) {
    let message = 'Unknown error';
    if (Array.isArray(error.body)) {
    message = error.body.map(e => e.message).join(', ');
    } else if (typeof error.body.message === 'string') {
    message = error.body.message;
    }
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Error loading Case',
    message,
    variant: 'error',
    }),
    );
    } else if (data) {
    this.accObj = data;
    this.accAlertMessage = this.accObj.fields.nrg__Alert_Message__c.value;
    let message = 'Alert Message: ' + this.accAlertMessage;
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Alert:',
    message,
    variant: 'info',
    
    }),
    );
    }
    }
    /* This method retrieves the Alert Message field value on Contact object
     */
    @wire(getRecord, { recordId: '$recordId', fields: ['Contact.nrg__Alert_Message__c'] })
    contactRecord({ error, data }) {
        console.log('data');
        console.log(data.isProxy);
    if (error) {
    let message = 'Unknown error';
    if (Array.isArray(error.body)) {
    message = error.body.map(e => e.message).join(', ');
    } else if (typeof error.body.message === 'string') {
    message = error.body.message;
    }
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Error loading Case',
    message,
    variant: 'error',
    }),
    );
    } else if (data) {
    this.contactObj = data;
    this.contactAlertMessage = this.contactObj.fields.nrg__Alert_Message__c.value;
    let message = 'Alert Message: ' + this.contactAlertMessage;
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Alert:',
    message,
    variant: 'info',
    
    }),
    );
    }
    }
    
     /* This method retrieves the 'Alert Message' field value on Case object
     */
    @wire(getRecord, { recordId: '$recordId', fields: ['Case.nrg__Alert_Message__c'] })
    caseRecord({ error, data }) {
    if (error) {
    let message = 'Unknown error';
    if (Array.isArray(error.body)) {
    message = error.body.map(e => e.message).join(', ');
    } else if (typeof error.body.message === 'string') {
    message = error.body.message;
    }
    this.dispatchEvent(
    new ShowToastEvent({
    title: 'Error loading Case',
    message,
    variant: 'error',
    }),
    );
    } else if (data) {
    this.caseObj = data;
    this.caseAlertMessage = this.caseObj.fields.nrg__Alert_Message__c.value;
    let message = 'Alert Message: ' + this.caseAlertMessage;
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