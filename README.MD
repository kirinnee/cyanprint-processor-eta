# CyanPrint Processor kirinnee/eta

NodeJS ETA templating engine

## Usage

To use this processor, add it to `cyan.yaml`:

```yaml
...
processors:
  - kirinnee/eta
```

Please convert this to any language you need.

The schema for this processor for Cyan is:
```javascript
function template() {
    return {
        processors: [
            {
                name: "kirinnee/eta",
                config: {
                    // Configuration for this processor
                    // see eta website for more information: https://eta.js.org/docs/api/configuration
                    eta: {
                        useWith: true,
                    },
                    // variables to pass in
                    vars: {
                        name: "Your Name"
                    }
                }
            }
        ],
        plugins: [],
    }
}
```


## Contributors
- [eta](mailto:kirinnee97@gmail.com)
