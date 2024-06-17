import { expect } from '@wdio/globals'
import HomePage from '../pageobjects/home.page.js'
import ResultsPage from '../pageobjects/results.page.js'

describe('Verify the user is able to search a product', () => {
    const productsToSearch = ["Laptop", "Smartphone", "Tablet"];

    productsToSearch.forEach(product => {
        describe(`Search for ${product}`, () => {
            before(async () => {
                await HomePage.open();
            });

            it(`the user should see the search product "${product}" on the results page`, async () => {
                await HomePage.searchProduct(product);
                const spanText = await ResultsPage.getSearchResultSpan();
                expect(spanText).toContain("Showing");
                expect(spanText).toContain(`results for "${product}"`);
            });
        });
    });
});

