echo '-----------'
echo '-----------'
echo '-----------'zipping'-----------'
"C:\Program Files\7-Zip\7z.exe" a ./index.zip -r ./*
echo '-----------'
echo '-----------'
echo '-----------'packaging '-----------'
aws cloudformation package --template-file ./template.yaml --output-template-file ./serverless.yaml --s3-bucket tcbuilds --s3-prefix wasan1-code-deploy
echo '-----------'
echo '-----------'
echo '-----------'deploying '-----------'
aws cloudformation deploy --template-file ./serverless.yaml --stack-name wasan2 --capabilities CAPABILITY_NAMED_IAM