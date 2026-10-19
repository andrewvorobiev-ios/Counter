import UIKit

class CounterViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!


    // MARK: - Types

    private enum CounterAction {
        case increment
        case decrement
        case reset
        case decrementFailed
    }

    // MARK: - Properties

    private let historyHeader = "История изменений:\n\n"

    private var counter = 0 {
        didSet {
            updateCounterLabel()
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        historyTextView.text = historyHeader
    }

    // MARK: - Actions

    @IBAction func incrementButtonTapped(_ sender: Any) {
        incrementCounter()
        historyCounter(.increment)
    }

    @IBAction func decrementButtonTapped(_ sender: Any) {
        if counter > 0 {
            decrementCounter()
            historyCounter(.decrement)
        } else {
            historyCounter(.decrementFailed)
        }
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        resetCounter()
        historyCounter(.reset)
    }

    // MARK: - Counter

    private func incrementCounter() {
        counter += 1
    }

    private func decrementCounter() {
        if counter > 0 {
            counter -= 1
        }
    }

    private func resetCounter() {
        counter = 0
    }

    // MARK: - UI Updates

    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }

    private func historyDateFormatter() -> String {
        return dateFormatter.string(from: Date())
    }

    private func historyCounter(_ action: CounterAction) {
        let date = historyDateFormatter()
        let message: String

        switch action {
        case .increment:
            message = "значение изменено на +1"

        case .decrement:
            message = "значение изменено на -1"

        case .reset:
            message = "значение сброшено"

        case .decrementFailed:
            message = "попытка уменьшить значение счётчика ниже 0"
        }

        let newEntry = "\(date): \(message)\n"
        let history = historyTextView.text.replacingOccurrences(
            of: historyHeader,
            with: ""
        )

        historyTextView.text = historyHeader + newEntry + history
        historyTextView.setContentOffset(.zero, animated: false)
    }
}
