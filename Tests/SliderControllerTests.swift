@testable import SliderController
import XCTest
import EarlGrey

class SliderControllerTests: XCTestCase {

    var sut: SliderController!
    var delegateSpy: SliderControllerDelegateSpy!
    var application: UIApplication!

    override func setUp() {
        super.setUp()

        delegateSpy = SliderControllerDelegateSpy()
        sut = SliderController()
        sut.unselectedTrackColor = .blue
        sut.selectedTrackColor = .red
        sut.delegate = delegateSpy

        application = UIApplication.shared
        application.keyWindow?.backgroundColor = .white
        application.keyWindow?.rootViewController = sut
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        delegateSpy = nil
        application = nil
    }

    func testMoveSliderToValue0_5() {
        let targetValue: Float = 0.5

        EarlGrey.select(elementWithMatcher: grey_kindOfClass(UISlider.self))
            .perform(grey_moveSliderToValue(targetValue))
            .assert(grey_sliderValueMatcher(grey_equalTo(targetValue)))
    }

    func testMoveSliderToValue1_0() {
        let targetValue: Float = 1.0

        EarlGrey.select(elementWithMatcher: grey_kindOfClass(UISlider.self))
            .perform(grey_moveSliderToValue(targetValue))
            .assert(grey_sliderValueMatcher(grey_equalTo(targetValue)))
    }

}
