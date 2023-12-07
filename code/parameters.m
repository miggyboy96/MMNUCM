global beta gamma mu

% Initialising global variable values
beta = getNumericInput('Enter the value for beta: ');
gamma = getNumericInput('Enter the value for gamma: ');
mu = getNumericInput('Enter the value for mu: ');

% Displaying inputted values
disp(['SIR parameters: beta = ', num2str(beta), ', gamma = ', num2str(gamma), ', mu = ', num2str(mu)]);

% Function that ensures input is suitable as parameters of the model
function val = getNumericInput(prompt)
    while true
        val = input(prompt);
        if isnumeric(val) && isscalar(val) && val > 0 % Stops when input is positive scalar
            break;
        else
            disp('Invalid input error. Input must be a positive scalar number');
        end
    end
end

