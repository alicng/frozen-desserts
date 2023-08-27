#!/bin/bash

# Replace these variables with your actual values
EC2_USER="$EC2_USER"
EC2_HOST="$EC2_INSTANCE_IP"
APP_DIR="/var/www/my_rails_app"  # Change this to the actual directory path on the server

# Load the SSH private key content from GitHub Secrets
echo "$EC2_SSH_PRIVATE_KEY" > ~/.ssh/deploy_key
chmod 600 ~/.ssh/deploy_key

# Copy your compiled code to the server
rsync -avz --delete --exclude=".git" ./ $EC2_USER@$EC2_HOST:$APP_DIR

# SSH into the server and perform further deployment steps
ssh -i ~/.ssh/deploy_key $EC2_USER@$EC2_HOST << EOF
  cd $APP_DIR
  
  # Example: Stop the old Puma process
  sudo systemctl stop puma
  
  # Example: Install any new gems
  bundle install --path vendor/bundle
  
  # Example: Precompile assets
  bundle exec rake assets:precompile
  
  # Example: Restart the Puma process
  sudo systemctl start puma
  
  # Add any other deployment steps here
EOF

echo "Deployment complete"
