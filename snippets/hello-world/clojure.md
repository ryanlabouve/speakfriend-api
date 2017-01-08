Run `lein new helloworld`.

Edit `project.clj` and add a `:main`, which will guide lein to our main function.

```
(defproject helloworld "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :main helloworld.core)
```

And then our main function in `src/helloworld/core.clj`:

```
(ns helloworld.core)

(defn foo
  "This is just a description of foo"
  [x]
  (println x "Hello, World!"))
```
