# ARG SPEC File

To run tests on Firebase Test Lab, the `gcloud firebase test android run` command requires arguments to specify what and how to run the following tests. For example, to run instrumentation tests, the following command will need to be executed:

```
gcloud firebase test android run \
  --type instrumentation \
  --app app-debug-unaligned.apk \
  --test app-debug-test-unaligned.apk \
  --device model=Nexus6,version=21,locale=en,orientation=portrait  \
  --device model=Nexus7,version=19,locale=fr,orientation=landscape
```

The configuration of these tests can get long and complex. Instead, the GitHub Action will instead the ARG SPEC file as an input which has the predefined configurations of the corresponding tests. Developers will need to create a YAML file specify how they would like to run the tests and make a reference to that file during the execution of the GitHub Action.

<br>

## Example ARG SPEC file
As an example, the configuration for the test are saved in the tests.yml file. A high-level arg-group is specified as `android-pixel-4` to specify that this is an Android test running on Pixel 4 device. However, the file name and arg-group can be named anything.

```
android-pixel-4:
  type: instrumentation
  app: app-debug.apk
  test: app-debug-test.apk
  device:
    - model: flame
      version: 29
      locale: 'en'
      orientation: portrait
```

In the GitHub Actions workflow, you must specify the `arg-spec` containing the path of this file along with the arg group.

<br>

## Arguments Reference
The following arguments used above are defined here. To see the full list of arguments, please check out the reference links below.
```
<arg-group>:
  type: <robo-or-instrumentation>
  app: <path-to-source-apk>
  test: <path-to-test-apk>
  device:
    - model: <model-id>
      version: <version>
      locale: <local>
      orientation: <portrait-landscape-default>
```

<br>

## Reference
- [Firebase Test Lab](https://firebase.google.com/docs/test-lab/android/command-line)
- [gcloud topic arg-file](https://cloud.google.com/sdk/gcloud/reference/topic/arg-files)
- [gcloud firebase test android run](https://cloud.google.com/sdk/gcloud/reference/firebase/test/android/run)
