# Decoupling microservices with Amazonmq MQ for RabbitMQ and AWS Lambda

This project is a solution architecture that demonstrates decoupling microservices with [Amazonmq MQ for RabbitMQ](https://aws.amazon.com/amazon-mq/) and [AWS Lambda](https://aws.amazon.com/lambda/). A decoupled application architecture allows each component to perform its tasks independentlyand a change in one service shouldn't require a change in the other services.

## Architecture

![MQ-Lambda Architecture diagram](https://gitlab.aws.dev/harniva/decoupling-microservices-lambda-amazonmq/-/blob/830ad6868dd39bff05f15fd3a18f8c813377b470/diagrams/mq_decoupled_apps.png)

## Setup

Clone this repository on the local machine

```bash
$ git clone https://<repo URL>
```

Then run the setup script. This will deploy CloudFormation stack in your AWS account.

```bash
$ cd decoupling-microservices-lambda-amazonmq
$ bash setup.sh
```

## Test

Test the solution by copying the API Gateway URL from the CloudFormation stack output and using that in the below cURL command

```bash
curl --location --request POST '<API Gateway URL>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "UpdateId":"1"
}'
```

## Clean up

You can clean up the resources to avoid being charged for the resources being deployed as part of this solution.

```bash
$ bash cleanup.sh
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
