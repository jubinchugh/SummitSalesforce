import { LightningElement } from 'lwc';

export default class LwcOne extends LightningElement {
    greeting = 'World';
    changeHandler(event){
        this.greeting = event.target.value;
    }
    
    ready = false;
    connectedCallback(){
        setTimeout(() => {
            this.ready = true;
        }, 3000);
    }
}