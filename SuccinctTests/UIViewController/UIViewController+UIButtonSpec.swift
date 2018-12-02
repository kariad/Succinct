import Quick
import Nimble
import Succinct

final class UIViewController_UIButtonSpec: QuickSpec {
    override func spec() {
        describe("finding a single button using exact text") {
            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.findButton(withExactText: "Login")).to(beNil())
                }
            }
            
            context("when button text does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    expect(viewController.findButton(withExactText: "ABC")).to(beNil())
                }
            }
            
            context("when a button exists with the expected text in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    let result = viewController.findButton(withExactText: "Login")
                    
                    
                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
            
            context("when a button exists with the expected text in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withTitleText("Login").build())
                                .build()
                        )
                        .build()
                    
                    
                    let result = viewController.findButton(withExactText: "Login")
                    
                    
                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
        }
        
        describe("if a view controller has a single button using exact text") {
            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beFalse())
                }
            }
            
            context("when button text does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withExactText: "ABC")).to(beFalse())
                }
            }
            
            context("when a button exists with the expected text in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
                }
            }
            
            context("when a button exists with the expected text in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withTitleText("Login").build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
                }
            }
        }

        describe("finding a single button using an image") {
            let catImage = UIImage(assetIdentifier: .obligatoryCatImage)!
            let foliageImage = UIImage(assetIdentifier: .obligatoryFoliageImage)!

            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.findButton(withImage: catImage)).to(beNil())
                }
            }
            
            context("when button image does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    expect(viewController.findButton(withImage: foliageImage)).to(beNil())
                }
            }
            
            context("when a button exists with the expected image in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    let result = viewController.findButton(withImage: catImage)
                    
                    
                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }
            }
            
            context("when a button exists with the expected image in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withImage(catImage).build())
                                .build()
                        )
                        .build()
                    
                    
                    let result = viewController.findButton(withImage: catImage)

                    
                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }
            }
        }
        
        describe("if a view controller has a single button using an image") {
            let catImage = UIImage(assetIdentifier: .obligatoryCatImage)!
            let foliageImage = UIImage(assetIdentifier: .obligatoryFoliageImage)!

            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.hasButton(withImage: foliageImage)).to(beFalse())
                }
            }
            
            context("when button image does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withImage: foliageImage)).to(beFalse())
                }
            }
            
            context("when a button exists with the expected image in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withImage: catImage)).to(beTrue())
                }
            }
            
            context("when a button exists with the expected image in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withImage(catImage).build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.hasButton(withImage: catImage)).to(beTrue())
                }
            }
        }
        
        describe("finding multiple buttons by button state") {
            context("when a button exists in the first subview") {
                var viewController: UIViewController!
                
                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                            UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                            UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                        )
                        .build()
                }
                
                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button exists in the second subview") {
                var viewController: UIViewController!
                
                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubviews(
                                    UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                                    UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                                    UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                                    UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                                    UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                                )
                                .build()
                        )
                        .build()
                }
                
                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }
                
                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }
        }
    }
}