# 소개

Spring Cloud Function을 Spring Native로 빌드하여 AWS Lambda에 배포할 수 있도록 템플릿을 제공합니다. 이를 통해 애플리케이션의 실행 시간과 메모리 사용량을 최적화할 수 있습니다.

# AWS Lambda 함수 빌드

## arm64 환경 빌드

```shell
make init-arm64
make lambda-arm64
```

## x86_64 환경 빌드

```shell
make init-amd64
make lambda-amd64
```

빌드가 완료되면 root 프로젝트 위치에 bundle.zip 파일이 생성됩니다.

# AWS Lambda 배포

![스크린샷 2023-05-21 오전 12.27.09.png](%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202023-05-21%20%EC%98%A4%EC%A0%84%2012.27.09.png)

- 런타임: Amazon Linux 2에서 자체 부트스트랩 제공
- 아키텍처: 빌드 환경 아키텍처

![스크린샷 2023-05-21 오전 1.24.47.png](%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202023-05-21%20%EC%98%A4%EC%A0%84%201.24.47.png)

- 빌드 완료 이후 root 프로젝트 위치에 있는 bundle.zip 파일 업로드
