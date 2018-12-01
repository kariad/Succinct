import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIButtonSpec: QuickSpec {
    private var buttonWasTapped = false
    private func unitTestButtonWasTapped() {
        buttonWasTapped = true
    }

    override func spec() {
        describe("button functionality") {
            beforeEach {
                self.buttonWasTapped = false
            }
            
            it("cannot tap a button when no buttons exist") {
                let viewController = UIViewControllerBuilder().build()
                viewController.loadViewControllerForUnitTest()
                
                
                viewController.tapButton(withExactText: "Login")
                
                
                expect(self.buttonWasTapped).to(beFalse())
            }

            it("cannot tap a button when the button text does not match") {
                let targetAction = TargetAction(self.unitTestButtonWasTapped)
                
                let loginButton = UIButtonBuilder()
                    .withTitleText("Login")
                    .withTargetAction(targetAction)
                    .build()
                
                let viewController = UIViewControllerBuilder()
                    .withSubview(loginButton)
                    .build()
                viewController.loadViewControllerForUnitTest()
                
                
                viewController.tapButton(withExactText: "ABC")
                
                
                expect(self.buttonWasTapped).to(beFalse())
            }
            
            it("can tap a button with exact text") {
                let targetAction = TargetAction(self.unitTestButtonWasTapped)

                let loginButton = UIButtonBuilder()
                    .withTitleText("Login")
                    .withTargetAction(targetAction)
                    .build()

                let viewController = UIViewControllerBuilder()
                    .withSubview(loginButton)
                    .build()
                viewController.loadViewControllerForUnitTest()


                viewController.tapButton(withExactText: "Login")


                expect(self.buttonWasTapped).to(beTrue())
            }
        }
    }
}
