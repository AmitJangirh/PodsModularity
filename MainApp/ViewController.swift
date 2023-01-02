//
//  ViewController.swift
//  MainApp
//
//  Created by amit jangirh on 02/01/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    private let label = UILabel()
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        setupConstraints()
        bindViewModels()
    }
    
    private func setupView() {
        label.textAlignment = .center
        [label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    private func bindViewModels() {
        viewModel
            .text
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
}

class ViewModel {
    var text: Observable<String> {
        Observable.create { observer in
            observer.onNext("This is sample text")
            return Disposables.create()
        }
    }
}
