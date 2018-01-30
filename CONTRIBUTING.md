# Contributing to MetalKitPlus

# Objective

MetalKitPlus is a framework consisting of several protocols, extensions and classes that built upon the MetalKit framework by Apple. We've built MetalKitPlus to minimize the amount of boilerplate code and in our projects and make it possible to work with Metal following the KISS principle.

You are welcome to use this library for your own projects. To ensure the framework adapts to many different use cases, we're happy to receive your suggestions, feature requests and ultimately pull requests. In order to keep our contributors in harmony, we've developed a contribution guideline, which provides you with a list of steps you should take, if you want to participate in our project.

# Vision

This project is about providing a frictionless Metal experience, similar to the way Core Image does, but without taking away the freedom of Metal. Right now, MetalKitPlus is primarily being used to develop image processing solutions, so our code might reflect that, but we're glad for suggestions on how to make MTKP even more versatile and support as many different types of shaders as possible.

When deceding about whether or not to include a new feature into MTKP, we're first going to evaluate whether this feature is useful for most users, or whether a lot of modifications are necessary while only providing little benefit for most users. We believe in keeping code as simple as possible, but no simpler, just like your favorite computing device.

## Contribution guideline

### In the beginning there were issues

Whenever you stumble upon an issue in our code, your safest bet to get help from our contributors is opening an issue in our GitHub repository (https://github.com/LRH539/MetalKitPlus/). When creating the issue, you should provide as much as information as possible, such as:

1. Provide Swift, Metal, XCode and OS version
2. Attach error logs whenever possible
3. Identify down possible causes for the bug
4. Suggest changes to the code or overall architecture:
    1. Point out the bug (or limitation)
    2. Explain why this bug exists
    3. Propose a solution (PRs welcome)
5. Focus on only one bug per issue
6. Await feedback

Try to describe only *one bug per issue*, whenever it's possible to narrow it down. Now you're good to go and we're looking forward to receiving your issues. Keep in mind, that this project focusses on providing a frictionless Metal experience, similar to the way CoreImage works, but without taking away the freedom of Metal.

### Pull requests are awesome

Whenever you create an issue, feel free to provide your possible solution in a pull request. Assuming you're not yet a contributor, the right way to get started is:

1. Create an issue (as described above)
2. Fork the repository, create a branch
3. Create a new branch (named fix/ISSUE_NUMBER)
4. Implement changes concerning that specific
5. Submit pull request

If you plan to regularly contribute to this project, we're also happy to add you to our contributors, since we're currently developing this in our spare time and could use some help. :)
