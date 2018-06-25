#testing and building node js
 324  curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
  325  sudo yum install -y nodejs
  326  ng serve
  327  ng serve --host $(hostname) --disable-host-check
  328  npm rebuild node-sass --force
  329  npm install
  330  ng serve --host $(hostname) --disable-host-check
  331  ng test
  332  ng test --watch false
  333  npm test
  334  npm build
  335  npm build .
  336  ng build --prod
  337  history 100
