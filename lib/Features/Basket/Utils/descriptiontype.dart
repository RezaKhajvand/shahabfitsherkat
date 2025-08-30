enum DescriptionType { tamrin, qazae }

String getDescriptionTitle(DescriptionType type) {
  switch (type) {
    case DescriptionType.tamrin:
      return 'تمرینی';

    case DescriptionType.qazae:
      return 'غذایی';
  }
}
