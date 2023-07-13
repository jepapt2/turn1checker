import 'package:form_builder_validators/form_builder_validators.dart';

import '../../i18n/i18n.g.dart';

final createDeckValidation = FormBuilderValidators.compose([
  FormBuilderValidators.required(errorText: t.text.deckNameRequiredError),
  FormBuilderValidators.minLength(1,
      errorText: t.text.deckNameMinLengthError(length: 1)),
  FormBuilderValidators.maxLength(32,
      errorText: t.text.deckNameMaxLengthError(length: 32)),
]);
