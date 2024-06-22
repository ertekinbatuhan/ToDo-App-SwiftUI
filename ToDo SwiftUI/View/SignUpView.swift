import SwiftUI

struct SignUpView: View {
    @State
    private var fullName = ""
    @State 
    private var email = ""
    @State
    private var password = ""
    
    @ObservedObject
    private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Image("sigIn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height * 0.3) // Ekran yüksekliğinin %30'u kadar resim boyutu
                        .cornerRadius(20.0)
                        .padding(.top, 50)
                    
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .autocapitalization(.words)
                    
                    TextField("E-mail", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
                    NavigationLink(destination: TabPage(), isActive: $viewModel.registrationSuccessful) {
                        Button("Sign Up") {
                                
                                viewModel.fullName = fullName
                                viewModel.email = email
                                viewModel.password = password
                    
                                viewModel.signUp()
                                
                            }
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        }
    }


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

