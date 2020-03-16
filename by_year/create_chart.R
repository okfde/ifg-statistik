library(tidyverse)

d1 <- read_csv("total_number_by_year.csv")

N <- n()

last <- slice(d1, N)
last_year <- last$year
last_requests <- last$requests

ggplot(data = d1, aes(x = year, y = requests)) +
  geom_step(color="#005bcd") +
  labs(title=paste("Anzahl der Informationsfreiheitsanfragen, 2006","\u2013", last_year, sep = ""), subtitle="Seit 2006 regelt das Informationsfreiheitsgesetz (IFG) den Zugriff auf staatliche Daten.", caption="Nur Anfragen auf Bundesebene. Quelle: Bundesinnenministerium", y="Anfragen pro Jahr") +
  theme_classic() +
  scale_x_continuous(breaks=pretty_breaks(n=N)) + 
  scale_y_continuous(breaks=pretty_breaks(n=5)) + 
  theme(
    panel.grid.major.y = element_line(colour = "grey", size = 0.1),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),
    axis.line.y=element_blank(),
    axis.ticks.y=element_blank(),
    axis.ticks.x=element_blank(),
    plot.caption = element_text(size=6),
    plot.subtitle = element_text(size=8),
    axis.text = element_text(size=7)
  ) +
  annotate("text", x = 2011, y = 9000, label = "Start von FragDenStaat", size=4) +
  annotate("text", x = last_year, y = last_requests + 500, label = paste(last_requests), size=4) + 
  annotate("segment", x = 2011, xend = 2011, y = 3800, yend = 8500,
           colour = "lightgrey")

ggsave(paste("requests_by_year_", last_year, ".png", sep=""), width=6, height=4)
