// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

extension MapExtensions<K, V> on Map<K, V> {
  Map<K, V> get filterOutNulls {
    final Map<K, V> filtered = <K, V>{};
    forEach((K key, V value) {
      if (value != null) filtered[key] = value;
    });
    return filtered;
  }
}
