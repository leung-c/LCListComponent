# LCListComponent
这是根据我平时工作中的做法总结出来的一个列表组装模式，目的是优化tableView或者collectionView cell的组装，让开发人员更专注于数据和业务逻辑的处理。
尤其是在列表中使用了多种不类型不同够功能的cell时候，这个模式能让我们更优雅的处理cell相关代码，极大减少针对各种类型和indexPath的判断。