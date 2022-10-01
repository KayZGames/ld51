import 'package:asset_data/asset_data.dart';

part 'assets.g.dart';

@Asset('asset:ld51/assets/img/assets.png')
const assetPng = BinaryAsset(_assetPng$asset);

@Asset('asset:ld51/assets/img/assets.json')
const assetJson = JsonAsset(_assetJson$asset);
