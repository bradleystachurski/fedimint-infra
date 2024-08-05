let
  dpc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOZjH1c5py2OnIp6YhSwoYeG91gfRNRl4fL+hIHaI1Ej dpc@ren";
  elsirion = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+t2YktQZWLbv2BmIkWv9G98L5nNwnsVGMszcbnTu3W25bp0CJ4MtBmvmagygfAd+td9dPe44assaU5XNk1+eK9CMx3X3LlkJ4sVr6EYDG+HrBiFSWSIGlYA6EblXXiCIzKh6i+dAM+c35YUZLBxfKaqaWEF1REiR7O1DQxH6TU3qCMStxY5PF1rtiLjVHPBTiWv41zynRRqfA5L+sE+/NYrZj6NIKL5p6zAhKwV8YRavVTOzGDr+Rn+10t907JHjydFK6LfKpUADr4c/XkMY8IRgKCZsBeu9C+N2y93CbyfPua5+s/6caO6wHNjBYi2599Ky84XBtVt/WUQtq5WwXAe97j6Z+3M8bEqUFLUQxQh4r1hOE9ApEUYY6T//wDvqPDVMsKTkMe8HiAjOZawjzjQWYutAjGjuug9efFoP9WJ39J3SfmTDUHo+4Pyf+2ntqUyp6SMmBu7eTHOw1a4kDaQvIltBcokdhMm12RNdTwCLMS0YvFiRcJmzuemiTw78=";
  users = [ dpc elsirion ];

  # Host key from /etc/ssh/ssh_host_rsa_key.pub
  runner-01 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpxCs5smpqE7iW0nxB+TRHkgcKTGqLhJbzz/0LvRRqpGKsiGJJlim69kHydKbciZnTxE9s2cuLiGtrtr6/1SnvwmwyHsr3shiIkP9zTWDIFZr+873aPmBWjo1TTVQevx0jAuT4rbofX/VG5zI02298jgj6laepZ4OtoWqNHi47avr0Rwlr2FYmTQ8+RylZIiYRb6Ew+ldQfDnNVLxd7wBTflrO6QvMVo7wu9pc29kqNup9XC8s4tXq/lWVIliTSxFn8aj+3kjw4UFk3O/2TEqm3mEd23wDP8CYMMlzvAMmnwsNg1C8nuZbxbswcGJTgLPclEDN/KRDnD5OeBd9lxGD21l7NSA7uhCTPsE4Bag6TaFirfJCj27x2bNE8yJOnaEtsH+6KbDCBHsnrgf2GRDg5Rbj9UvxAQn/zuNcs2jkYVPiccJbeCftuJ55VMIvdtHdE+/KvlgEyc1t5KKpbD8r7welIr6jrQJZgT2hoRoPYi5lLSAzW0vKV/K8CteJtKkEj3cmT3JshkwhFOF/K5S/z0UzhHDldyp3Y2K5TS6KCfHwk/zNp8Dor6oIuyckDbNYq8+3KxtxBe/Xr+vjD29oHT+Q69sLklZEdrtcT7d4O6O6nu6abt6RHLHZ549+NoMuU9F+G/KNFI1rWoO+2IczIlWLVBw7b4kBZ1h7NrulEw== root@runner-01";
  runner-02 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBDMOgwfKVMJuJwUtNcK7CWjY6fVGbMFY+LlLp2cHNTyR9ngb6SJj5pk3GKY9/5ZGBaDnR3QtvlNaEayYoz0w+hcozS4VIrtLMZ33KCP5ZrGrWIOkD8fZXqy4xbsGQ/OW/i+fEVaSo/8cG3AfwCg7lwLnMOnPQHpyOQcwTD2sffk9xkvcimVQ9j4KtsWjHD1HpeF3z6J+fQFQNWe+/on13qSqu3KaUUUci9Qe4aD4XetXnKTjHctaQzcEOxm1UvXCieNmlcRD1ODmphFgQXBlkokZ/ajguqjXp5yvir6FAHHVEcj3J1X1qPtNiALbJsW5c21z9JUg81GpMxujtrfCllfnbzVUyM/oTL7t/fxaEFJv67fcLgDwks32HvK5I6snIfoxJFMZyqhsXgB7Lml+9iJg5afZ3dnAWIjqxYiFEVbQe1yeqsKEIoi4zIwd2tV2SFBOeaNgQOF38wrs+XRyy4A6fUXr1SZUBwqw/s+IWHI1YDlRd24QNEth2erskpl/WYVG7WHYRtL7wjI3P5zRMkcLK8lja0eV2IkF8Xd9UOgqDMV3UhHQNAoFgPnijrdY3ri8nRnzoZCLfNVG/+c2/Xd1ViU7012Zd+4QDTT7Z6Cg9Ib0LpNgobzHcnCVwk2Be8FoaJ9eXSbMRNqzGAFWhvOzF3EwJBP90sfBz+I86Bw== root@runner-02";
  runner-03 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCBdr+DwjO97FZeSiO2QWy6eB9gFjXSxexIedh3tGyQg36kU5T1j1pqJ5yX/w07c+XYsdyZdPoG32lHUqIbwBiAuceunx5QXnWhDlsPr2dRWXtyNLnnlBcc7eZ5OkoBTA+uH5tEC80jlS/DJCL+rk1iGlbU0vMElZbVF4EG8xLRmNmJcdLjoRalbxsQza4BoSUSmAFIiw2opUe6YIVXSRuXeCVePhAp5kvJ8mhuHLTzh86doPoMuNXHJyxSGO+ECTjqopTk2Ql6qZnCmZNegoXAdLxN2KVQVkmRhA0xbY+cROcMc6GuKFuvlfBm+oeLoucPR7mOrBuyKJUnc2Jewy8IIz3JMyQf6+MZ12g2g+ROj/Z/IU2UkK44aSwbUalF01UjOqBtwuBvFOV6u8+CHkbjAwMfB/tXA18KEsLv6MM+1fC331gAmrvKMYLARLBdY7XUgpjNfZzZ69D9GJzeKdaPECdHLf5CbWQ5mJGCzJZlKjdxhbugj+U7SH83yEC5iAzwzULwXAkitlPrBUNRYSI5gnHpYy/PbaKdkyRHadOI/5uqJ6Sl/dcLSjKHbI0OB+1+Z2sUb3UIxbbGBxoL8M3JgLwYj8QnAZbF84M3Yml6t4YMi2VTje2GpVDa5c1jG8wSUwDarE0wkoVlbbk5Kk1061ACbvVn4EmeyVyYh5kJw== root@runner-03";
  runner-04 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7msYyj9yx3HuHGjlROyulATolkCkQY6utfl1gZ3kVDfp2ZC+XATF2DD1ah2IKt/n+1RrOmS+pQUgZqMsPHvG9HIxUheUn2XlbRKlLOfQ8C0M/VE6Lx4ZA622xsUdu7WpxfBYNlrxZt7Q55FgXZ4ekj4Z4812SahU5Fd5IKQeZtr1ZHOevjyxcgb3CZr+1nfHHrebppS5Pwo4pJa+TEBUcS0wTYgP/PR1n3uyPgnHvZY+8OoQs8oGzNlKn1PdrLD9SrjZr8afuFUCxCZPDXzCnKpXz10ZfPCpVtgbD4jecHxJdedrdyuO1HfTHSuMXw8JgExxwjk1vErA1uwFWkj62EVw/7f2I+avRy2ltcdKTr1frloYQPpmj/+9P7CaZRSB36sOTLzLbi/t8qAlX0hW9oAyWbAU5fl+PgoG2Yz26nNKuCKaeZtG91wMVeiLpzo1rCBJlhUCYSgX/CBfT6LwIhucidNh8NEsGZ9v+jampKmbCWIIRRoHOKyYqmQ/MFpu2LfnGDbeHg5tj532gARxRHrfbKHqp1GlK5bg/I5x+LjaVUEJnQvywIzydLAOGC6JZEDCOd6Do4CRphemV3BIGq5C7w/sUpPk/8zvjwJ0Wf0cBeLewDIBirDGF6BAtqiB39lypOqXdXDF4COWDGBNofXCoGnMwW4jDXquhWgQkBQ== root@runner-04";
  fedimintd-01 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFv3eNsEvTbMkEwm7RdMJDLSfPVcKfN3MIGZyDU4t6SFd1SaZOOsI7D7mjItDaWkQqVTVPlY6aY3ur55IJa6vFqYMx1rsh8X0U2FNqcZ2UIBrDCniuqo/ykJGAacn0uEPqGjzXqMSh7Tg2kmXkN4awAsBV7mbfg5yBarr7WGJJ2wQhvp1C8CtVYznSNB5w1dW520aWRLUwAkLwou7ud2yvcIE6/fTTaVO/DlDlNqUVede5Uwro3jw/NOhXq+zU2vqqFZwfpy2CgFoqx8D/vMshP5Ei7YrcWhkZR9inuOn6cggZfpAbSbNGyXnxC4DySoBbqnttEcz6xafD2zonZm/+OFfSm7lsCaaLPJbw6mAQfeK8XbNIsoHWvAeErGHub+F02uDZ30lB4ue9h6bIqNxiqXbvuAQWe8oFOCnKPNYJLVvBmtpU7/iZ7Nqy0h5NWGguuegSxKVXXaua/8UhEPScEslrL6EI7q/NCdcgraPMjukPD7sue9YZV91N3Cst9iJkdgVwZjWs9PRLyW0x4A7Kc1x0sjOozjoLd0pmx8O/GtVmvPkbXVh74iyO4JfOv7LpgLAS9VzXXUy3OkAsQqRrwKMeTZUuLc5WSUVTNtuN8ktHWh3g2ubF5jvE5HhoOQ51lx4Ew0WoQCGJre1o0swpffCLqo39HEEWcmxQCtOB4w== root@fedimintd-01";
  runners = [ runner-01 runner-02 runner-03 runner-04 ];
  fedimintds = [ fedimintd-01 ];
in
{
  "secrets/github-runner.age".publicKeys = runners ++ users;
  "secrets/perfitd.age".publicKeys = [ runner-01 runner-04 ] ++ users;
  "secrets/perfitd-info.age".publicKeys = users;
  "secrets/radicle-seednode.age".publicKeys = [ runner-04 ] ++ users;
  "secrets/bitcoind-signet-pass.age".publicKeys = fedimintds ++ users;
}

