const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
    entry: './index.coffee',
    watch: true,
    output: {
        path: path.resolve("./dist"),
        //publicPath: "dist/",
    },
    // output: {
    //     // options related to how webpack emits results
    //     path: path.resolve(__dirname, "dist"), // string
    //     // the target directory for all output files
    //     // must be an absolute path (use the Node.js path module)
    //     filename: "bundle.js", // string
    //     // the filename template for entry chunks
    //     publicPath: "/assets/", // string
    //     // the url to the output directory resolved relative to the HTML page
    //     library: "MyLibrary", // string,
    //     // the name of the exported library
    //     libraryTarget: "umd", // universal module definition
    //
    // },
    module: {
        // configuration regarding modules
        rules: [
            {
                test: /\.coffee$/,
                use: [
                    // apply multiple loaders and options
                    "coffee-loader"
                ]
            },
            {
                test: /\.mustache$/,
                loader: 'mustache-loader'
                // loader: 'mustache-loader?minify'
                // loader: 'mustache-loader?{ minify: { removeComments: false } }'
                // loader: 'mustache-loader?noShortcut'
            },
            {
                test: /\.css$/i,
                exclude: /node_modules/,
                use: ExtractTextPlugin.extract({
                    fallback: "style-loader",
                    use: "css-loader"
                })
            },
            {
                test: /\.less$/,
                exclude: /node_modules/,
                use: ExtractTextPlugin.extract({
                    fallback: "style-loader",
                    use: ["css-loader","less-loader"]
                }),
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                use: [
                    'file-loader',
                ],
            }
        ]
    },
    resolve: {
        // options for resolving module requests
        // (does not apply to resolving to loaders)
        modules: [
            "node_modules",
            path.resolve(__dirname, "app")
        ],
        // directories where to look for modules
        extensions: [".coffee", ".js", ".json", ".jsx", ".css"],
        // extensions that are used
        alias: {
            // a list of module name aliases
            "$": "jquery",
            // alias "module" -> "new-module" and "module/path/file" -> "new-module/path/file"
            "_": "lodash",
        },
    },
    plugins: [
        new ExtractTextPlugin({
            filename: "main.css"
        })
    ]
}