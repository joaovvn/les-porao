// SUCCESS
const ok = (httpResponse, content) =>
  httpResponse.status(200).json({
    code: 'OK',
    content,
  });

const created = (httpResponse, content, message) =>
  httpResponse.status(201).json({
    code: 'CREATED',
    message,
    content,
  });

// CLIENT ERROR
const badRequest = (httpResponse, description) =>
  httpResponse.status(400).json({
    code: 'BAD_REQUEST_ERROR',
    description,
  });

const notFoundRequest = (httpResponse, description) =>
  httpResponse.status(404).json({
    code: 'NOT_FOUND_ERROR',
    description,
  });

const unauthorized = httpResponse =>
  httpResponse.status(401).json({
    code: 'UNAUTHORIZED',
    message: 'Not allowed to perform this action.',
  });

// SERVER ERROR
const serverError = (httpResponse, error, description = 'Something wrong happened.', query) => {
  httpResponse.status(500).json({
    code: 'SERVER_ERROR',
    description,
    error: error.toString(),
    message: error.message,
    ...(query || undefined),
  });
};

const requiredField = (httpResponse, field, message = `O campo ${field} é inválido.`) =>
  httpResponse.status(422).json({
    code: 'REQUIRED_FIELD_MISSING',
    message,
    field,
  });

module.exports = {
  badRequest,
  created,
  ok,
  serverError,
  requiredField,
  unauthorized,
  notFoundRequest,
};
