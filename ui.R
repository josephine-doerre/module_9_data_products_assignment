library(shiny)
library(samplingbook)

ui <- fluidPage(
    h1("Developing Data Products: Final Assignment"),
    h2("Sample Size Calculation"),
    h5("This app calculates the sample size required to estimate the true mean value with the desired level of confidence and precision. The acceptable error in the estimate 
    is half the width of the desired confidence interval. For example, if you wanted the width of the confidence interval to be roughly 2 units you would get an accuracy of +/- 1."),
    tabsetPanel(
        tabPanel("Documentation", withMathJax(),
                 hr('The formula for the calculation for the case that the the proportion of the sample size n divided by the population size N is greater than 0.05 : $$n = \\frac{S^2}{\\frac{e^2}{q^2} + \\frac{S^2}{N}}$$ 
       If the opposite is the case, the calculation is simplified to: $$n = \\frac{q^2 \\cdot S^2}{e^2}$$ which is exclusivley used in this application. The Parameter q is internally calculated and is a quantile (q = qnorm((1 + level)/2)), the default value for level is .95.'),
                 h5('To utilize the application you have to set two parameters. The Precision e and the standard deviation S in the underlying population. An appropriate estimate for S could be the standard deviation s of an earlier sample.'),
                 a(href="https://cran.r-project.org/web/packages/samplingbook/index.html", "Used Package for Calculation"),
        ),
        tabPanel("Application",
                 numericInput('e', 'Precision (e)', 1, min = 0.0001, max = 100000),
                 numericInput('S', 'Standard Deviation in the Population (S)', 0, min = 0, max = 10000),
                 textOutput('samplesize'))
    )
)
