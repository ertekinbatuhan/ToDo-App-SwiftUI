import SwiftUI

struct SignInView: View {
    
    @State
    private var email = ""
    @State
    private var password = ""
    @ObservedObject
    private var viewModel = SignInViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                   
                    Image("login")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height * 0.4)
                        .cornerRadius(20.0)
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 20)
                    
                   
                    Text("Sign In")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.bottom, 20)
                    
                   
                    TextField("Enter e-mail", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                   
                    SecureField("Enter password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
                    NavigationLink(destination : TabScreen() , isActive: $viewModel.loginSuccesfull) {
                        Button("Log In") {
                           
                            viewModel.email = email
                            viewModel.password = password
                            viewModel.signIn()
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    .padding(.top, 20)
                    }
                    NavigationLink(destination: SignUpView()) {
                        Text("Don't have an account?")
                            .foregroundColor(.blue)
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white).navigationBarBackButtonHidden(true)
                
                
            }
        }
    }
}

#Preview {
   SignInView()
}



