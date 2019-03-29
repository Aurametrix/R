# Built-in two-way ANOVA.
a = car::Anova(aov(value ~ mood * group, D), type='II')  # Normal notation. "*" both multiplies and adds main effects
b = car::Anova(aov(value ~ mood + group + mood:group, D))  # Identical but more verbose about main effects and interaction

# Testing the interaction terms as linear model.
full = lm(value ~ 1 + group_a + group_b + mood_happy + group_a:mood_happy + group_b:mood_happy, D)  # Full model
null = lm(value ~ 1 + group_a + group_b + mood_happy, D)  # Without interaction
c = anova(null, full)  # whoop whoop, same F, p, and Dfs
