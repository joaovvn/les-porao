const validateEmail = (email) => {
  let result = /\S+@\S+\.\S+/;

  return result.test(email);
}

module.exports = {
  validateEmail
}
