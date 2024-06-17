import { expect } from '@wdio/globals'
import HomePage from '../pageobjects/home.page.js'
import ResultsPage from '../pageobjects/results.page.js'

describe('Verify the user is able to search a product', () => {
    let productToSearch:string
    
    before(async () => {
        // Runs before all tests in the suite
        await HomePage.open()
        productToSearch = "Laptop"
    });

    it('the user should see the search product on the results page', async() =>{
        await HomePage.searchProduct(productToSearch)
        const spanText = await ResultsPage.getSearchResultSpan()
        expect(spanText).toContain("Showing")
        expect(spanText).toContain(" results for \"Laptop\"")
    })
})

