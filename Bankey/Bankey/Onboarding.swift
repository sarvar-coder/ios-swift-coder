//
//  Onboarding.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 26/10/24.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingViewController: UIViewController {
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    
    let closeButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = FirstViewController(heroImage: "delorean", titleText: "Bankey is faster, easy to use and has a brand new look and feel that will make you feel like you are back in 1989")
        let page2 = FirstViewController(heroImage: "world", titleText: "Move your money arround the world quickly and securely")
        let page3 = FirstViewController(heroImage: "thumbs", titleText: "Learn more at www.bankey.com")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()

    }
    
    
    
    private func setup() {
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func style() {
        closeButton.setTitle("Close", for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
        doneButton.isHidden = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTaped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(closeButton)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        view.addSubview(doneButton)
        // close button
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
        ])
        // back button
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 3)
        ])
        // next button
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 3)
        ])
        // done button
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 3)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

// MARK: - Actions
extension OnboardingViewController {
    @objc func closeTapped(_ sender: UIButton) {
        // TODO
        print("Tapped")
        delegate?.didFinishOnboarding()
    }
    @objc func doneTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
    
    @objc func nextTaped(_ sender: UIButton) {
        guard let nextVC = getNextViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([nextVC], direction: .forward, animated: true) { _ in
            if self.currentVC == self.pages[2] {
                self.nextButton.isHidden = true
                self.doneButton.isHidden = false
            }
        }
    }
    
    @objc func backTapped(_ sender: UIButton) {
        guard let previousVC = getPreviousViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true) { _ in
            self.nextButton.isHidden = false
            self.doneButton.isHidden = true
        }
    }
}
