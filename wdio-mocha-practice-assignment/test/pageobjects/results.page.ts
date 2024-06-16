import { $ } from "@wdio/globals";
import Page from "./page.js";
import { ChainablePromiseElement } from "webdriverio";

/**
 * sub page containing specific selectors and methods for a specific page
 */
class ResultsPage extends Page {
  /**
   * define selectors using getter methods
   */
  public get flashAlert() {
    return $("#flash");
  }

  public get getSpanText(): ChainablePromiseElement<WebdriverIO.Element> {
    return $(".BUOuZu");
  }

  public async getSearchResultSpan(): Promise<string> {
    const spanText = await this.getSpanText;
    await spanText.waitForDisplayed();
    const spanTextVal = await spanText.getText();
    console.log("text from browser", spanTextVal);
    return spanText.getText();
  }
}

export default new ResultsPage();
