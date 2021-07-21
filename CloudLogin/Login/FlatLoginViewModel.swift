import Combine
import SwiftUI

enum LoginFields: String {
    case email
    case password
}

class FlatLoginViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var editingPasswordTextfield: Bool = false
    @Published var editingEmailTextfield: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { $0.userInfo?[UIResponder.keyboardIsLocalUserInfoKey] }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                self.editingPasswordTextfield = false
                self.editingEmailTextfield = false
                print("close keyboard")
            })
        .store(in: &subscriptions)
        
        $password
            .dropFirst(1)
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main )
            .removeDuplicates()
            .sink(receiveValue: self.beginPasswordEditing(fieldValue: ))
            .store(in: &subscriptions)
        
        $email
            .dropFirst(1)
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main )
            .removeDuplicates()
            .sink(receiveValue: self.beginEmailEditing(fieldValue: ))
            .store(in: &subscriptions)
    }
    
    deinit {
        subscriptions.forEach({$0.cancel()})
    }
}

extension FlatLoginViewModel {
    var currentFlatLoginView: some View {
        return FlatLoginView(viewModel: FlatLoginViewModel())
    }
    
    func beginEmailEditing(fieldValue value: String) {
        self.editingEmailTextfield = true
        self.editingPasswordTextfield = false
        print("update email")
    }
    
    func beginPasswordEditing(fieldValue value: String) {
        self.editingEmailTextfield = false
        self.editingPasswordTextfield = true
        print("update password")
    }
}

