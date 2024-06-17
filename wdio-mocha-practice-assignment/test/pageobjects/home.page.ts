import { $ } from '@wdio/globals'
import Page from './page.js';

/**
 * sub page containing specific selectors and methods for a specific page
 */
class HomePage extends Page {
    /**
     * define selectors using getter methods
     */
    public get inputUsername () {
        return $('#username');
    }

    public get inputPassword () {
        return $('#password');
    }

    public get btnSubmit () {
        return $('button[type="submit"]');
    }

    public get searchButton(){
        return $('[name=q]');
    }

    /**
     * a method to encapsule automation code to interact with the page
     * e.g. to login using username and password
     */
    public async login (username: string, password: string) {
        await this.inputUsername.setValue(username);
        await this.inputPassword.setValue(password);
        await this.btnSubmit.click();
    }

    /**
     * overwrite specific options to adapt it to page object
     */
    public open () {
        return super.open('');
    }

    public async searchProduct(productName:string){
        const searchBtn= await this.searchButton;
        await searchBtn.waitForDisplayed();
        await searchBtn.setValue(productName); //Enter the product name
        await searchBtn.addValue('\uE007');  // Simulate pressing the Enter key
    }
}

export default new HomePage();

