
> Cambiar URL en el frontend
```bash
prototype.url = API_BASE + '/sales/sales-masterdata/processing-commissions';
```




>Estructura 
  
client-gateway

dto	
```
export class SearchFobsFobsDto {

  

    @IsString()

    IN_A1728CCUST?: string;
    
    //paginado (page,start,limit)

    @IsOptional()

    @Transform(({ value }) => {

        if (value === '' || value === null || value === undefined) return undefined;

        return Number(value);

    })

    @IsInt()

    @Min(0)

    page?: number;

  

    @IsOptional()

    @Transform(({ value }) => {

        if (value === '' || value === null || value === undefined) return undefined;

        return Number(value);

    })

    @IsInt()

    @Min(0)

    start?: number;

  

    @IsOptional()

    @Transform(({ value }) => {

        if (value === '' || value === null || value === undefined) return undefined;

        return Number(value);

    })

    @IsInt()

    @Min(1)

    limit?: number;
}
```

controller

```
import {

  Controller,

  Get,

  Post,

  Body,

  Patch,

  Param,

  Delete,

  Inject,

  Query,} from '@nestjs/common';

import { ClientProxy, RpcException } from '@nestjs/microservices';

import { NATS_SERVICE } from '../../../config';

import { firstValueFrom } from 'rxjs';

import { SearchFobsFobsDto } from './dto/search-fobs-fobs.dto';

import { DetailFobsFobsDto, DetailXlsxFobsFobsDto } from './dto/detail-fobs-fobs.dto';

import { AcuseFobsFobsDto } from './dto/acuse-fobs-fobs.dto';

import { LoadMailFobsFobsDto, SendMailFobsFobsDto } from './dto/loadmail-fobs-fobs.dto';

import { Public } from '../../../common/decorators';

  

@Controller({ version: '1', path: 'sales/sales-commissions/fobs-fobs' })

export class FobsFobsController {

  constructor(

    @Inject(NATS_SERVICE) private readonly client: ClientProxy,

  ) { }

  

  @Post('/search')

  async search(@Body() dto: SearchFobsFobsDto) {

    try {

      return await firstValueFrom(

        this.client.send('sales.sales-commissions.fobs-fobs.search', dto),

      );

    } catch (error) {

      throw new RpcException(error);

    }

  }

```

module

```
 providers: [],

```



microservicio
	 dto
	 
	entity
	 
	controller
	 
	modulo