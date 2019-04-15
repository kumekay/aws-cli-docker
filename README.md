# AWS CLI Docker Image

![Docker Stars](https://img.shields.io/docker/stars/kumekay/aws-cli.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/kumekay/aws-cli.svg)
![Docker Automated Builds](http://img.shields.io/docker/automated/kumekay/aws-cli.svg)

This image provides the AWS CLI, Elastic Beanstalk CLI a few other tools, including jq.

## Providing Credentials

Credentials can be provided in any of the aws-cli supported formats.

### Using credentials file

If you need to create the credentials file, you can use the aws-cli configure command by using the following command:

```
docker run --rm -tiv $HOME/.aws:/root/.aws kumekay/aws-cli aws configure
```

From that point on, simply mount the directory containing your config.

```
docker run --rm -v $HOME/.aws:/root/.aws kumekay/aws-cli aws s3 ls
```

To start with elastic beanstalk for your project (placed at `~/projects/app`):

```
docker run --rm -tiv $HOME/.aws:/root/.aws $HOME/projects/app:/app kumekay/aws-cli eb init
```

### Using environment variables

This is supported, although NOT encouraged, as the environment variables can end up in command-line history, available for container inspection, etc.

- AWS_ACCESS_KEY_ID` - specify the access key ID
- AWS_SECRET_ACCESS_KEY` - the secret access key

```
docker run --rm -e AWS_ACCESS_KEY_ID=my-key-id -e AWS_SECRET_ACCESS_KEY=my-secret-access-key -v $(pwd):/aws kumekay/aws-cli aws s3 ls 
```

## Using the container as a CLI command

You can setup an alias for `aws` to simply start a container, hiding the fact that it's not actually installed on the machine. Then, updating the version simply becomes a `docker pull kumekay/aws-cli`.

```
alias aws='docker run --rm -tiv $HOME/.aws:/root/.aws -v $(pwd):/aws kumekay/aws-cli aws'
```

