import {
  ProcessorOutput,
  StartProcessorWithLambda,
} from "@atomicloud/cyan-sdk";
import { Eta } from "eta";
import type { Eta as EtaType } from "eta/dist/types/core";
import type { EtaConfig } from "eta/dist/types/config";

StartProcessorWithLambda(
  async (input, fileHelper): Promise<ProcessorOutput> => {
    const procConfig: { eta: Partial<EtaConfig>; vars: unknown } =
      input.config as {
        eta: Partial<EtaConfig>;
        vars: unknown;
      };

    const etaConfig = procConfig.eta;

    const eta: EtaType = new Eta(etaConfig);

    const template = fileHelper.resolveAll();

    template
      .map((x) => {
        x.content = eta.renderString(x.content, procConfig.vars);
        x.relative = eta.renderString(x.relative, procConfig.vars);
        return x;
      })
      .map((x) => x.writeFile());

    return { directory: input.writeDir };
  },
);
