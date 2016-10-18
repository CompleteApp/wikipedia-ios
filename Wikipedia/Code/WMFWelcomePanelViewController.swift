
class WMFWelcomePanelViewController: UIViewController {

    @IBOutlet private var containerView:UIView!
    @IBOutlet private var nextButton:UIButton!
    @IBOutlet private var titleLabel:UILabel!
    @IBOutlet private var subtitleLabel:UILabel!

    private var viewControllerForContainerView:UIViewController? = nil
    var welcomePageType:WMFWelcomePageType = .intro

    override func viewDidLoad() {
        super.viewDidLoad()
        embedContainerControllerView()
        updateUIStrings()
        nextButton.setTitleColor(UIColor.wmf_blueTintColor(), forState: .Normal)
        containerView.layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
    }
    
    private func embedContainerControllerView() {
        if let containerController = containerController {
            containerController.willMoveToParentViewController(self)
            containerView.addSubview((containerController.view)!)
            containerController.view.mas_makeConstraints { make in
                make.top.bottom().leading().and().trailing().equalTo()(self.containerView)
            }
            self.addChildViewController(containerController)
            containerController.didMoveToParentViewController(self)
        }
    }
    
    private lazy var containerController: UIViewController? = {
        switch self.welcomePageType {
        case .intro:
            assert(false, "Intro welcome view is not embedded in a panel.")
            return nil
        case .languages:
            return WMFWelcomeLanguageTableViewController.wmf_viewControllerWithIdentifier("WMFWelcomeLanguageTableViewController", fromStoryboardNamed: "WMFWelcome")
        case .analytics:
            return WMFWelcomeAnalyticsViewController.wmf_viewControllerWithIdentifier("WMFWelcomeAnalyticsViewController", fromStoryboardNamed: "WMFWelcome")
        }
    }()

    private func updateUIStrings(){
        switch self.welcomePageType {
        case .intro:
            assert(false, "Intro welcome view is not embedded in a panel.")
        case .languages:
            titleLabel.text = localizedStringForKeyFallingBackOnEnglish("welcome-languages-title").uppercaseStringWithLocale(NSLocale.currentLocale())
            subtitleLabel.text = localizedStringForKeyFallingBackOnEnglish("welcome-languages-sub-title")
            nextButton.setTitle(localizedStringForKeyFallingBackOnEnglish("welcome-languages-continue-button").uppercaseStringWithLocale(NSLocale.currentLocale()), forState: .Normal)
        case .analytics:
            titleLabel.text = localizedStringForKeyFallingBackOnEnglish("welcome-volunteer-title").uppercaseStringWithLocale(NSLocale.currentLocale())
            subtitleLabel.text = localizedStringForKeyFallingBackOnEnglish("welcome-volunteer-sub-title")
            nextButton.setTitle(localizedStringForKeyFallingBackOnEnglish("button-done").uppercaseStringWithLocale(NSLocale.currentLocale()), forState: .Normal)
        }
    }
}
