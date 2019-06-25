## docker-solr 应用介绍
---
- Solr是基于Apache Lucene ™构建的流行，快速，开源的企业搜索平台。

- Solr具有高可靠性，可扩展性和容错性，可提供分布式索引，复制和负载均衡查询，自动故障转移和恢复，集中配置等。Solr为世界上许多最大的互联网站点的搜索和导航功能提供支持。

- Solr是一个独立的企业搜索服务器，具有类似REST的API。您通过JSON，XML，CSV或二进制文件将文档放入其中（称为“索引”）。您可以通过HTTP GET查询它并接收JSON，XML，CSV或二进制结果。

官方网站：https://lucene.apache.org/solr/

## 使用方法与特性

- 基础镜像采用了[Solr官方镜像](https://hub.docker.com/_/solr?tab=description)，可以适配其所有环境变量设置。

- 当前版本 8.0.0。

- 支持中文分词器 IKAnalyzer 及其扩展库。

- 初始安装会自动生成core，默认名称为 mycore， 可以通过环境变量 `CORE_NAME` 指定。

- 根据分配内存自动配置JVM内存，请不要再去设置环境变量 `SOLR_HEAP` 去指定。
