% Lab10 Task 2

user('jood', '1234').
user('student', 'prolog2026').
user('admin', 'admin123').


login :-
    try_login(3).

try_login(AttemptsLeft) :-
    AttemptsLeft > 0,
    write('Username: '), flush_output,
    read_line_to_string(user_input, Username),
    write('Password: '), flush_output,
    read_line_to_string(user_input, Password),
    atom_string(UserAtom, Username),
    atom_string(PassAtom, Password),
    (   user(UserAtom, PassAtom)
    ->  writeln('Login Successful')
    ;   writeln('Login Unsuccessful'),
        Remaining is AttemptsLeft - 1,
        (   Remaining > 0
        ->  try_login(Remaining)
        ;   writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
        )
    ).
