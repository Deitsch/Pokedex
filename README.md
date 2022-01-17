# Pokedex
A SwiftUI App displaying Pokemon Info from http://Pokeapi.co

## open improvements
* store code in keychain -> create keychain wrappedObject similar to AppStorage()

## Issues
### Open issues 

### Known and handled issues
```
cv == 0x7fda6c12da00 Disabling recursion trigger logging
```
Seems to be a simple debug / diagnostic left by a dev. https://www.hackingwithswift.com/forums/ios/disabling-recursion-trigger-logging/10036

```
Writing analzed variants.
```
Seems to be log noise https://developers.apple.com/forums/thread/689066

```
boringssl_metrics_log_metric_block_invoke(144) Failed to log metrics
```
Seems to be apple log noise