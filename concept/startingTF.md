Terraform 시작하는 방법
테라폼을 설치하는 방법은 간단하다.
choco 혹은 winp(?)을 이용해서 설치한다.
이후 TF를 이용해서 AWS 혹은 Provider에 접속해야 하는 일이 발생하는데 
이 때 2가지 방식을 이용할 수 있다.
    1. 직접 [provider.tf]에 선언하는 것
    2. AWScli에 credential정보를 입력하는 것
이와 같은 정보를 작성하지 않는다면 다음과 같은 오류가 발생한다.
> Error: error configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.