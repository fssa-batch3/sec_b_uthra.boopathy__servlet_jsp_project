class Users {
    uname
    phonenumber
    password
    address
    age
    email
    designation

ValidateUserName(uname){
    const pattern = new RegExp (/^[A-Za-z]+$/)
    return pattern.test(uname)
}

ValidatePhoneNumber(phonenumber){
    const pattern = new RegExp (/[6-9]{1}[0-9]{9}/)
    return pattern.test(phonenumber)
}

ValidatePassword(password){
    const pattern = new RegExp (/(?=.*\d)(?=.*[*!@#$%^&])(?=.*[a-z])(?=.*[A-Z]).{8,}/)
    return pattern.test(password)
}

ValidateAddress(address){
    const pattern = new RegExp (/[0-9A-Za-z]/)
    return pattern.test(address)
}

ValidateAge(age){
    const pattern = new RegExp (/[1]{1}[0-9]{1}/)
    return pattern.test(age)
}

ValidateEmail(email){
    const pattern = new RegExp (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)
    return pattern.test(email)
}

ValidateDesignation(designation){
    const pattern = new RegExp (/[A-Z]/)
    return pattern.test(designation)
}

}

// const _uname = "Uthra"
// const _phonenumber = "9876543210"
// const _password = "Uthr678#"
// const _address = "34/78, Mela puthu street, Ambai, Tirunelveli"
// const _email = "uthra@gmail.com"
// const _age = "19"
// const _designation = "User"

const user = new Users();
if (user.ValidateUserName(_uname)){
    console.log("User name is valid");
}
else {
    console.log("User name is not valid");
}

if (user.ValidateAddress(_address)){
    console.log("User address is valid");
}
else {
    console.log("User address is not valid");
}

if (user.ValidateAge(_age)){
    console.log("User age is valid");
}
else {
    console.log("User age is not valid");
}

if (user.ValidateDesignation(_designation)){
    console.log("User designation is valid");
}
else {
    console.log("User designation is not valid");
}

if (user.ValidateEmail(_email)){
    console.log("User email is valid");
}
else {
    console.log("User email is not valid");
}

if (user.ValidatePassword(_password)){
    console.log("User password is valid");
}
else {
    console.log("User password is not valid");
}

if (user.ValidatePhoneNumber(_phonenumber)){
    console.log("User phone number is valid");
}
else {
    console.log("User phone number is not valid");
}