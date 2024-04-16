# Golang Response Echoer

The `golang-response-echoer` is a versatile HTTP server written in Go, designed to echo back various HTTP responses based on the incoming requests. It supports echoing back status codes, headers, environment variables, the request body, and the current time. This tool is especially useful for testing, debugging HTTP clients, and learning more about HTTP protocols.

## Features

- **Echo Status Codes**: Dynamically return a sequence of HTTP status codes.
- **Echo Time**: Return the current server time.
- **Echo Environment Variables**: Echo back the request headers.
- **Echo Request Body**: Return the body of the request.
- **Customizable Logging**: Supports JSON and text logging formats.

## Getting Started

### Prerequisites

- Docker
- Go (if running locally without Docker)

### Running with Docker

To run `golang-response-echoer` using Docker, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/NoNickeD/golang-response-echoer.git
   cd golang-response-echoer
   ```

2. Build the Docker image:

   ```bash
   docker build -t golang-response-echoer .
   ```

3. Run the container:
   ```bash
   docker run -p 8080:8080 --name echoer golang-response-echoer
   ```

### Running Locally

If you prefer to run the server locally without Docker:

1. Clone the repository and navigate to it as shown above.

2. Run the server:
   ```bash
   cd ./echo-server/
   go run main.go
   ```

## Usage

Below are some examples of how you can interact with the echo server using `curl`:

### Echo Status Code Sequence

- Initialize the sequence:

  ```bash
  curl -i "http://localhost:8080/?echo_code=200-400-500&init=1"
  ```

  ```bash
  for i in {1..10}
  do
      curl http://localhost:8080/\?echo_code\=200-400-500
  done
  ```

- Get the next status code in the sequence:
  ```bash
  curl -i "http://localhost:8080/?echo_code"
  ```

### Echo Current Time

- Get the current time:
  ```bash
  curl "http://localhost:8080/?echo_time"
  ```

### Echo Request Headers

- Echo back request headers:
  ```bash
  curl -H "Custom-Header: Value" "http://localhost:8080/?echo_env"
  ```

### Echo Request Body

- Echo back the request body:
  ```bash
  curl -d "This is a test body" "http://localhost:8080/?echo_body"
  ```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
