//
//  ViewController.swift
//  Clock
//
//  Created by Bowon Han on 12/31/23.
//

import UIKit
import SnapKit

class ClockViewController: UIViewController {
    
    // viewModel 생성 -> 이때 didset을 호출해도 동작 실행안됨
    // why? 코드가 먼저 메모리에 올라간 후 viewdidload를 업데이트 시키니까
    private var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setLayout()
        startTimer()
        setBinding()
    }
    
    private var closureTimeLabel : ClockStackView = {
        let timeLabelStackView = ClockStackView()
        timeLabelStackView.label.text = "closure"
        timeLabelStackView.timeLabel.text = "time"
        
        return timeLabelStackView
    }()

    private var observableTimeLabel : ClockStackView = {
        let timeLabelStackView = ClockStackView()
        timeLabelStackView.label.text = "observer"
        timeLabelStackView.timeLabel.text = "time"
        
        return timeLabelStackView
    }()

    
    // 매초마다 시간을 업데이트 한다는 의미
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    func setBinding() {
//        viewModel.didChangeTime = { [weak self] viewModel in
//            self?.closureTimeLabel.timeLabel.text = viewModel.closureTime
//        }
        
        viewModel.observableTime.bind { [weak self] time in
            self?.observableTimeLabel.timeLabel.text = time
        }
    }
    
    private func setLayout() {
        [closureTimeLabel,observableTimeLabel].forEach {
            view.addSubview($0)
        }
        
        closureTimeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        observableTimeLabel.snp.makeConstraints {
            $0.top.equalTo(closureTimeLabel.snp.bottom).offset(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

